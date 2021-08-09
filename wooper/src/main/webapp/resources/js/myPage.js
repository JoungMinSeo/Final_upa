function LoadImg(value, num) {
    if (value.files && value.files[0]) {
        var reader = new FileReader();

        reader.readAsDataURL(value.files[0]);

        reader.onload = function(e) {
            $(".img-class").eq(num).children("img").attr("src",e.target.result);
        }

    }
}