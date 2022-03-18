$(document).ready(() => {
    window.addEventListener('message', function (event) {
        let data = event.data;
        if (data.open == "open") {
            $("body").fadeIn(250);
        } else if (data.open == "close") {
            $("body").fadeOut(250);
            $(".purchase-container").hide();
        };
        if (data.update == "vehHolder") {
            $("#bottom-container").empty();
            $.each(data.vehicles, function (index, value) {
                $("#bottom-container").prepend(
                    `<div class="preview-img-holder">
                        <img src="imgs/${value.sCode}.png" class="preview-img" data-price="${value.price}" data-name="${value.displayName}" data-spawn="${value.sCode}">
                        <div class="vehicle-price">$${value.price}</div>
                    </div>
                    `
                );
            });
        };
        if (data.update == "notification") {
            $(".purchase-btn").addClass("bounce");
            setTimeout(() => {
                $(".purchase-btn").removeClass("bounce");
            }, 2000);
        };
    });
    document.onkeyup = function (data) {
        if (data.which == 27) {
            closeUI();
        };
    };
    $(".scroll-left-btn").on("click", "", function () {
        const conent = document.querySelector('#bottom-container');
        conent.scrollLeft -= 600;
    }); 
    $(".scroll-right-btn").on("click", "", function () {
        const conent = document.querySelector('#bottom-container');
        conent.scrollLeft += 600;
    }); 
    $(".category-item").on("click", "", function () {
        $.post('https://drp-cardealer/category', JSON.stringify({
            type: $(this).html()
        }));
        $(".category-item").removeClass("active-category");
        $(this).addClass("active-category");
        const conent = document.querySelector('#bottom-container');
        conent.scrollLeft -= 100000;
    }); 
    $("#bottom-container").on("click", ".preview-img", function () {
        $.post('https://drp-cardealer/previewVeh', JSON.stringify({
            model: $(this).data("spawn")
        }));
        $(".purchase-name").html($(this).data("name"));
        $(".purchase-price").html("$" + `${$(this).data("price")}`);
        $(".purchase-container").show();
        $(".purchase-btn").data("spawn", $(this).data("spawn"));
        $(".purchase-btn").data("price", $(this).data("price"));

        $(".finance-btn").data("spawn", $(this).data("spawn"));
        $(".finance-btn").data("price", $(this).data("price"));
        
        $(".finance-price").html("$" + `${Math.ceil($(this).data("price") / 3)}`);
    });  

    $(".purchase-btn").on("click", "", function () {
        $.post('https://drp-cardealer/purchaseVeh', JSON.stringify({
            spawnName: $(this).data("spawn"),
            price: $(this).data("price"),
        }));
    });


    $(".finance-btn").on("click", "", function () {
        $.post('https://drp-cardealer/financeVeh', JSON.stringify({
            spawnName: $(this).data("spawn"),
            price: $(this).data("price"),
        }));
    });
});

closeUI = () => {
    $.post('https://drp-cardealer/close', JSON.stringify({}));
};