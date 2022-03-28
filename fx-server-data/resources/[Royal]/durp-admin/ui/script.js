let incorrectsubmission = 0
let successpass = 0
let allowedpass = false
let selectedplayer = ""

document.onkeydown = function(evt) {
    evt = evt || window.event;
    if (evt.keyCode == 27) {
        $('.container-modmenu').hide();
        $.post('http://durp-admin/closenui', JSON.stringify({}));
    }
};

window.addEventListener('message', (event) => {
	let data = event.data
	if(data.action == 'openadmin') {
        $('.container-modmenu').show();
	}

    if(data.action == 'closenui') {
        $('.container-modmenu').hide();
        $.post('http://durp-admin/closenui', JSON.stringify({}));
	}

    if(data.action == 'playerretrieve') {
        destroy()
        const onlineplayers = data.players;

        var x = document.getElementById("bigboyplayers");
        var option = document.createElement("option");
        option.text = "Select player";
        x.add(option, x[0]);

        let i, len, text;
        for (i = 0, len = onlineplayers.length, text = ""; i < len; i++) {
            let select = document.createElement('option');
            select.id = 'individualplayer';
            select.class = 'widgieboyclub';
            select.innerHTML = '<p>' + '['+onlineplayers[i][1]+'] ' + onlineplayers[i][0] + '</p>';
            select.value = onlineplayers[i][1];
            document.getElementById("bigboyplayers").appendChild(select);
        }

        select = document.getElementById("bigboyplayers")

        select.onchange = function () {
            selectedplayer = this.value;
        };
	}  
})


function destroy(){
    let element = document.getElementById("bigboyplayers");
    while (element.firstChild) {
        element.removeChild(element.firstChild);
    }
}

// function extendmenu() {
//     $(".container-modmenu").css("width" , "96%");
//     $(".container-modmenu").css("transition" , "1");
//     $(".left-nav").css("width" , "2.5%");
//     $(".top-nav").css("width" , "97.4%");
//     $(".top-nav").css("left" , "2.60%");
//     $(".actions-scroll").css("width" , "101.5%");
//     $(".actions-scroll").css("left" , "-8%");
//     $(".actions-scroll").css("top" , "-1%");
//     $("#individualplayer").css("top" , "-20.5%");
//     $("#individualplayer").css("left" , "-0%");

//     $(".playerscontainer").css("left" , "-0.1%");
//     $(".playerscontainer").css("width" , "103.4%");
    
//     $(".container3").css("width" , "108.25%");
//     $(".container3").css("left" , "-1.5%");

//     $(".content").css("left" , ".1%");
//     $(".content").css("width" , "92.025%");

//     $(".playerlist").css("height" , "88%");
//     $('.extend-menu').hide();
//     $('.shorten-menu').show();
// }

// function shortenmenu() {
//     $(".container-modmenu").css("width" , "22.7%");
//     $(".container-modmenu").css("transition" , "1");
//     $(".left-nav").css("width" , "10.05%");
//     $(".top-nav").css("width" , "90%");
//     $(".top-nav").css("left" , "10%");
//     $(".actions-scroll").css("width" , "90%");
//     $(".actions-scroll").css("top" , "1%");
//     $(".actions-scroll").css("left" , "");
//     $("#individualplayer").css("top" , "-5%");
//     $("#individualplayer").css("width" , "90%");

//     $(".playerscontainer").css("left" , "4.5%");
//     $(".playerscontainer").css("width" , "96.5%");
    
//     $(".container3").css("width" , "100%");
//     $(".container3").css("left" , "0%");

//     $(".content").css("left" , ".6%");
//     $(".content").css("width" , "91.85%");
    
//     $(".playerlist").css("height" , "91%");
//     $('.extend-menu').show();
//     $('.shorten-menu').hide();
// }

function userstage() {
    $('.stage-players').hide();
    $('.stage-two').hide();
    // $('.stage-admin').hide();
    $('.stage-user').show();
    //$('.stage-three').hide();
    //$('.stage-four').fadeIn();
    // document.getElementById("stage1button").classList.remove("btnactive");;
    document.getElementById("stage2button").classList.remove("btnactive");;
    document.getElementById("stageplayerbutton").classList.remove("btnactive");;
    document.getElementById("stageuserbutton").classList.add("btnactive");;
}

function playersstage() {
    $('.stage-players').show();
    $('.stage-two').hide();
    // $('.stage-admin').hide();
    $('.stage-user').hide();
    //$('.stage-three').hide();
    //$('.stage-four').fadeIn();
    // document.getElementById("stage1button").classList.remove("btnactive");;
    document.getElementById("stage2button").classList.remove("btnactive");;
    document.getElementById("stageplayerbutton").classList.add("btnactive");;
    document.getElementById("stageuserbutton").classList.remove("btnactive");;
}

function stageone() {
     $('.stage-players').hide();
     $('.stage-two').hide();
    //  $('.stage-admin').show();
     $('.stage-user').hide();
     //$('.stage-three').hide();
     //$('.stage-four').fadeIn();

    // document.getElementById("stage1button").classList.add("btnactive");;
    document.getElementById("stage2button").classList.remove("btnactive");;
    document.getElementById("stageplayerbutton").classList.remove("btnactive");;
    document.getElementById("stageuserbutton").classList.remove("btnactive");;
}

function stagetwo() {
    $('.stage-players').hide();
    $('.stage-two').show();
    // $('.stage-admin').hide();
    $('.stage-user').hide();
    //$('.stage-three').hide();
    //$('.stage-four').fadeIn();

    // document.getElementById("stage1button").classList.remove("btnactive");;
    document.getElementById("stage2button").classList.add("btnactive");;
    document.getElementById("stageplayerbutton").classList.remove("btnactive");;
    document.getElementById("stageuserbutton").classList.remove("btnactive");;
}

function tptomarker() {
   // $('.stage-four').fadeIn();
   
   $.post('http://durp-admin/tptomarker', JSON.stringify({}));
} 

function jobvu() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobvu', JSON.stringify({}));
} 

function jobgallery() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobgallery', JSON.stringify({}));
} 

function jobsrs() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobsrs', JSON.stringify({}));
} 

function jobpdm() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobpdm', JSON.stringify({}));
} 

function jobburgershot() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobburgershot', JSON.stringify({}));
} 

function jobtokyos() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobtokyos', JSON.stringify({}));
} 

function jobrecords() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobrecords', JSON.stringify({}));
} 

function jobharmony() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobharmony', JSON.stringify({}));
} 

function jobhayes() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobhayes', JSON.stringify({}));
} 

function jobmamas() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobmamas', JSON.stringify({}));
} 

function jobestate() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobestate', JSON.stringify({}));
} 

function jobadmin() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobadmin', JSON.stringify({}));
} 

function jobems() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobems', JSON.stringify({}));
} 

function jobleo() {
    // $('.stage-four').fadeIn();
    
    $.post('http://durp-admin/jobleo', JSON.stringify({}));
} 

function sendAnnounce(){
    
    var message = document.getElementById("announce").value;

    $.post('http://durp-admin/sendAnnouncement', JSON.stringify({message}));
}

function maxstats(){
    
    $.post('http://durp-admin/maxstats', JSON.stringify({}));
}

function currentcoords(){
    
    $.post('http://durp-admin/getplayercoords', JSON.stringify({}));
}

function spawncarmenu() {
    $('.solo-input').show();
    $('.spawncarinput').show();
    $('.garagestateinput').hide();
}

function spawncarnow() {
    $('.solo-input').hide();
    $('.spawncarinput').hide();
    var carname = document.getElementById("spawncar").value;
    $.post('http://durp-admin/spawncar', JSON.stringify({carname}));
}

function spawnitemnow() {
    
    $('.solo-input').hide();
    $('.spawniteminput').hide();
    var itemname = document.getElementById("spawnitem").value;
    var itemamount = document.getElementById("spawnitemamount").value;

    $.post('http://durp-admin/spawnitem', JSON.stringify({itemname, itemamount}));
}

function spawnitemmenu() {
    $('.solo-input').show();
    $('.spawniteminput').show();
    $('.spawncarinput').hide();
    $('.garagestateinput').hide();
}

function backfromsolo() {
    $('.solo-input').hide();
    $('.spawncarinput').hide();
    $('.spawniteminput').hide();
    $('.garagestateinput').hide();
}

function setgaragestatemenu() {
    $('.solo-input').show();
    $('.garagestateinput').show();
    $('.spawniteminput').hide();
    $('.spawncarinput').hide();
}

function setgaragestate() {
    
    $('.solo-input').hide();
    $('.garagestateinput').hide();
    var licenseplate = document.getElementById("licenseplate").value;
    var garagename = document.getElementById("garagename").value;

    $.post('http://durp-admin/durp-admin:update:vehicle:cl', JSON.stringify({licenseplate, garagename}));
}

function viewentity() {
    $.post('http://durp-admin/viewentity', JSON.stringify({}));
}

function devmodecheckbox() {
    // Get the checkbox
    var checkBox = document.getElementById("devmodecheckbox");
    // Get the output text
  
    // If the checkbox is checked, display the output text
    var returnvalue = checkBox.checked
    if (checkBox.checked == true){
        $.post('http://durp-admin/devmode', JSON.stringify({returnvalue}));
    } else {
        $.post('http://durp-admin/devmode', JSON.stringify({returnvalue}));
    }
}

// function debugmodecheckbox() {
//     // Get the checkbox
//     var checkBox = document.getElementById("debugmodecheckbox");
//     // Get the output text
  
//     // If the checkbox is checked, display the output text
//     var returnvalue = checkBox.checked

//     if (checkBox.checked == true){
//         $.post('http://durp-admin/debugmode', JSON.stringify({returnvalue}));
//     } else {
//         $.post('http://durp-admin/debugmode', JSON.stringify({returnvalue}));
//     }
// }

function godmodecheckbox() {
    // Get the checkbox
    var checkBox = document.getElementById("godmodecheckbox");
    // Get the output text
  
    // If the checkbox is checked, display the output text
    var returnvalue = checkBox.checked

    if (checkBox.checked == true){
        $.post('http://durp-admin/godmode', JSON.stringify({returnvalue}));
    } else {
        $.post('http://durp-admin/godmode', JSON.stringify({returnvalue}));
    }
}

function invisiblecheckbox() {
    // Get the checkbox
    var checkBox = document.getElementById("invisiblecheckbox");
    // Get the output text
  
    // If the checkbox is checked, display the output text
    var returnvalue = checkBox.checked

    if (checkBox.checked == true){
        $.post('http://durp-admin/invisible', JSON.stringify({returnvalue}));
    } else {
        $.post('http://durp-admin/invisible', JSON.stringify({returnvalue}));
    }
}

function healcheckbox() {
    $.post('http://durp-admin/heal', JSON.stringify({}));
}

function revivepersonal() {
    $.post('http://durp-admin/revivepersonal', JSON.stringify({}));
}

function spectateplayer() {
    $.post('http://durp-admin/spectateplayer', JSON.stringify({selectedplayer}));
}

function deletevehicle() {
    $.post('http://durp-admin/deletevehicle', JSON.stringify({selectedplayer}));
}

function bringplayer() {
    $.post('http://durp-admin/bringplayer', JSON.stringify({selectedplayer}));
}

function teleporttoplayer() {
    $.post('http://durp-admin/teleporttoplayer', JSON.stringify({selectedplayer}));
}

function reviveplayer() {
    $.post('http://durp-admin/reviveplayer', JSON.stringify({selectedplayer}));
}

function healplayer() {
    $.post('http://durp-admin/healplayer', JSON.stringify({selectedplayer}));
}

function fixcarplayer() {
    $.post('http://durp-admin/fixcarplayer', JSON.stringify({selectedplayer}));
}

function fixcarpersonal() {
    $.post('http://durp-admin/fixcarpersonal', JSON.stringify({}));
}

function RemoveStress() {
    $.post('http://durp-admin/removestress', JSON.stringify({}));
    
} 

function ViewEntities() {
    $.post('http://durp-admin/ViewEntities', JSON.stringify({}));
    
}

function Clothingmenu() {
    $.post('http://durp-admin/clothingmenu', JSON.stringify({}));
    $('.container-modmenu').hide();
}

function searchplayer() {
    $('.container-modmenu').hide();
    $.post('http://durp-admin/searchinventoryplayer', JSON.stringify({selectedplayer}));
}

function Clothingmenuplayer() {
    $('.container-modmenu').hide();
    $.post('http://durp-admin/clothingmenuplayer', JSON.stringify({selectedplayer}));
}