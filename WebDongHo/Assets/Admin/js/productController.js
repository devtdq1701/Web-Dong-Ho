var product = {
    init: function () {
        product.registerEvents();
    },
    registerEvents: function () {
        $('.btn-images').each(function () {
            $(this).off('click').on('click', function (e) {
            e.preventDefault();
            $('#imageManager').modal('show');
            $('#hidProductID').val($(this).data('id'));
            product.loadImages();
            });
        });
        $('#btnChooseImages').off('click').on('click', function () {
            var finder = new CKFinder();
            finder.selectActionFunction = function (url) {
                $('#imageList').append('<div style="float: left; margin-right: 4px; position: relative"><img src="' + url + '" style="height: 100px; width: 150px; object-fit: cover" /><a href="#" style="position: absolute;right: 5px;top: 2px;" }" class="btn-delImage"><i class="fa fa-times"></i></a></div>');
                $('.btn-delImage').off('click').on('click', function (e) {
                    e.preventDefault();
                    $(this).parent().remove();
                });
            };
            finder.popup();
        });
        $('#btnSaveImages').off('click').on('click', function () {
            var images = [];
            var id = $('#hidProductID').val();
            $.each($('#imageList img'), function (i, item) {
                var res = $(item).prop('src').substring(22);
                images.push(res);
            })
            $.ajax({
                url: '/Admin/Products/SaveImages',
                data: {
                    id: id,
                    images: JSON.stringify(images)
                },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        $('#imageManager').modal('hide');
                        $('#imageList').html('');
                    }
                }
            })
        });

    },
    loadImages: function () {
        $.ajax({
            url: '/Admin/Products/LoadImages',
            data: {
                id: $('#hidProductID').val(),
            },
            dataType: 'json',
            type: 'GET',
            success: function (res) {
                if (res.status == true) {
                    var data = res.data;
                    var html = '';
                    $.each(data, function (i, item) {
                        html+='<div style="float: left; margin-right: 4px; position: relative"><img src="' + item + '" style="height: 100px; width: 150px; object-fit: cover" /><a href="#" style="position: absolute;right: 5px;top: 2px;" }" class="btn-delImage"><i class="fa fa-times"></i></a></div>';
                    });
                    $('#imageList').html(html);
                }
            }
        });
        $('.btn-delImage').off('click').on('click', function (e) {
            e.preventDefault();
            $(this).parent().remove();
        });
    }
}
product.init();
