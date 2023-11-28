$(function () {
    function display(bool) {
        if (bool) {
            document.getElementById("body").style.display="block";
        } else {
            document.getElementById("body").style.display="none";
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
                $(".main-text").text(item.key)
                $(".main-text1").text(item.text)
            } else {
                display(false)
            }
        }
    })
    
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://bit-interact/exit', JSON.stringify({}));
            return
        }
    };
        
})