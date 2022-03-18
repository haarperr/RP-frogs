$(document).ready(function() {
    var curTask = 0;
    let canvas = document.getElementById("canvas");
    let ctx = canvas.getContext("2d");
    let W = canvas.width;
    let H = canvas.height;
    let degrees = 0;
    let new_degrees = 0;
    let time = 0;
    let color = "#ff0000";
    let txtcolor = "#ffffff";
    let bgcolor = "#404b58";
    let bgcolor2 = "#41a491";
    let bgcolor3 = "#00ff00";
    let key_to_press;
    let g_start, g_end;
    let animation_loop;
    let streak = 0;
    let percent = 0;
    let speed = [8, 10, 15, 90];
  
    function getRandomInt(min, max) {
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
    }
  
    function openMain() {
        $(".divwrap").css("display", "block");
        draw();
    }
  
    function closeMain() {
        $(".divwrap").css("display", "none");
        streak = 0;
        speed = [8, 10, 15, 90];
    }
  
    function init() {
    
    // Clear the canvas every time a chart is drawn
    ctx.clearRect(0,0,W,H);

    // Background 360 degree arc
    ctx.beginPath();
    ctx.strokeStyle = bgcolor;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, 0, Math.PI * 2, false);
    ctx.stroke();

    // Green zone
    ctx.beginPath();
    ctx.strokeStyle = correct === true? bgcolor3 : bgcolor2;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, g_start - 90 * Math.PI / 180, g_end - 90 * Math.PI / 180, false);
    ctx.stroke();

    // Angle in radians = angle in degrees * PI / 180
    let radians = degrees * Math.PI / 180;
    ctx.beginPath();
    ctx.strokeStyle = color;
    ctx.lineWidth = 40;
    ctx.arc(W / 2, H / 2, 90, radians - 0.1 - 90 * Math.PI / 180, radians - 90 * Math.PI / 180, false);
    ctx.stroke();

    // Adding the key_to_press
    ctx.fillStyle = txtcolor;
    ctx.font = "100px sans-serif";
    let text_width = ctx.measureText(key_to_press).width;
    ctx.fillText(key_to_press, W / 2 - text_width / 2, H / 2 + 35);
}

function draw() {
    if (typeof animation_loop !== undefined) clearInterval(animation_loop);

    g_start = getRandomInt(20,40) / 10;
    g_end = getRandomInt(3,5) / 10;
    g_end = g_start + g_end;

    degrees = 0;
    new_degrees = 360;

    key_to_press = ''+getRandomInt(1,4);

    time = getRandomInt(1, 3) * 6;

    animation_loop = setInterval(animate_to, time);
}
  
    function animate_to() {
        if (degrees >= new_degrees) {
          if (streak > 0) {
              closeMain();
              $.post('http://drp-bar/taskCancel', JSON.stringify({
                  tasknum: curTask
              }));
              streak = 0;
              speed = [8, 10, 15, 90];
          } else {
              wrong();
          }
          return;
        }
        degrees += 2;
        init();
    }
  
    function correct() {
        streak++;
        if (streak > 2) {
            closeMain();
            $.post('http://drp-bar/taskEnd', JSON.stringify({
                taskResult: percent
            }));
        } else {
            draw();
        }
    }
  
    function wrong() {
        streak = 0;
        speed = [8, 10, 15, 90];
        draw();
    }
  
    window.addEventListener('message', function(event) {
  
        var item = event.data;
        if (item.runProgress === true) {
            openMain();
        }
  
        if (item.closeFail === true) {
            closeMain();
            $.post('http://drp-bar/taskCancel', JSON.stringify({
                tasknum: curTask
            }));
            streak = 0;
            speed = [8, 10, 15, 90];
        }
  
        if (item.closeProgress === true) {
            closeMain();
            streak = 0;
            speed = [8, 10, 15, 90];
        }
  
    });
  
    
    document.onkeydown = function (data) {
  
      let key_pressed = data.key;
      let valid_keys = ['1','2','3','4'];
      if(valid_keys.includes(key_pressed) ){
          if( key_pressed === key_to_press ){
              let d_start = (180 / Math.PI) * g_start;
              let d_end = (180 / Math.PI) * g_end;
              if( degrees < d_start ){
                  // console.log('Failed: Too soon!');
                  closeMain();
                  $.post('http://drp-bar/taskCancel', JSON.stringify({
                      tasknum: curTask
                  }));
                  wrong();
              }else if( degrees > d_end ){
                  // console.log('Failed: Too late!');
                  closeMain();
                  $.post('http://drp-bar/taskCancel', JSON.stringify({
                      tasknum: curTask
                  }));
                  wrong();
              }else{
                  console.log('Success!');
                  correct();
              }
          }else{
              // console.log('Failed: Pressed '+key_pressed+' instead of '+key_to_press);
              closeMain();
              $.post('http://drp-bar/taskCancel', JSON.stringify({
                  tasknum: curTask
              }));
              wrong();
          }
      }
    }
  
  
  });