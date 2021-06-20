var cart = {
    init: function () {
        cart.regEvents();
    },
    regEvents: function () {
        $('.mini-cart-header').off('click').on('click', function () {
            if ($('.minicart-number').text() == "0") {
                $('#empty-alert').show();
                $('#empty-alert').delay(1000).fadeOut(500);
            } else {
                window.location.href = "/gio-hang";
            }
        });
        //$('#btnUpDate').off('click').on('click', function () {
        //    var listProducts = $('.qty-input');
        //    var cartList = [];
        //    $.each(listProducts, function (i, item) {
        //        cartList.push({
        //            Quantity: $(item).val(),
        //            Product: {
        //                ID: $(item).data('id')
        //            }
        //        });
        //    });
        //    $.ajax({
        //        url: '/Cart/Update',
        //        data: { cartModel: JSON.stringify(cartList) },
        //        dataType: 'json',
        //        type: 'POST',
        //        success: function (res) {
        //            if (res.status == true) {
        //                window.location.href = "/gio-hang";
        //            }
        //        }
        //    })
        //});
        $('.ajax_add_to_cart').off('click').on('click', function () {
            $.ajax({
                url: '/Cart/Add',
                data: {
                    quantity: 1,
                    id: $(this).data('id')
                },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    $('.minicart-number').html(res.Qty);
                    $('#success-alert').show();
                    $('#success-alert').delay(1000).fadeOut(500);
                }
            })
        });
        $('#single_add_to_cart_button').off('click').on('click', function () {
            $.ajax({
                url: '/Cart/Add',
                data: {
                    quantity: 1,
                    id: $(this).data('id')
                },
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    $('.minicart-number').html(res.Qty);
                    $('#success-alert').show();
                    $('#success-alert').delay(1000).fadeOut(500);
                }
            })
        });
        $('.cart_item').each(function () {
            var spinner = $(this),
                input = spinner.find('input[type="number"]'),
                btnUp = spinner.find('.plus'),
                btnDown = spinner.find('.minus'),
                btnRemove = spinner.find('.remove'),
                thisTotalPrice = spinner.find('.cart-p-price'),
                thisPrice = thisTotalPrice.data('price'),
                min = input.attr('min'),
                max = input.attr('max');

            btnUp.click(function () {
                var oldValue = parseFloat(input.val());
                if (oldValue >= max) {
                    var newVal = oldValue;
                } else {
                    var newVal = oldValue + 1;
                }
                spinner.find("input").val(newVal);
                spinner.find("input").trigger("change");
                var cartList = [];
                cartList.push({
                    Quantity: input.val(),
                    Product: {
                        ID: input.data('id')
                    }
                });
                $.ajax({
                    url: '/Cart/Update',
                    data: {
                        cartModel: JSON.stringify(cartList)
                    },
                    dataType: 'json',
                    type: 'POST',
                    success: function (res) {
                        $price = thisPrice * newVal;
                        thisTotalPrice.html(addCommas($price));
                        $('.minicart-number').html(res.Qty);
                        $('.price').html(res.Total);
                    }
                })
            });

            btnDown.click(function () {
                var oldValue = parseFloat(input.val());
                if (oldValue <= min) {
                    var newVal = oldValue;
                } else {
                    var newVal = oldValue - 1;
                }
                spinner.find("input").val(newVal);
                spinner.find("input").trigger("change");
                var cartList = [];
                cartList.push({
                    Quantity: input.val(),
                    Product: {
                        ID: input.data('id')
                    }
                });
                $.ajax({
                    url: '/Cart/Update',
                    data: {
                        cartModel: JSON.stringify(cartList)
                    },
                    dataType: 'json',
                    type: 'POST',
                    success: function (res) {
                        $price = thisPrice * newVal;
                        thisTotalPrice.html(addCommas($price));
                        $('.minicart-number').html(res.Qty);
                        $('.price').html(res.Total);
                    }
                })
            });
            btnRemove.off('click').on('click', function () {
                $.ajax({
                    data: {
                        id: btnRemove.data('id')
                    },
                    url: 'Cart/Delete',
                    dataType: 'json',
                    type: 'POST',
                    success: function (res) {
                        spinner.remove();
                        if (res.Qty == 0) {
                            setTimeout(function () {
                                window.location.href = "/";
                            }, 500);
                            $('#empty-alert').delay(1000).show();
                            $('#empty-alert').delay(1000).fadeOut(500);
                        } else {
                            $('.minicart-number').html(res.Qty);
                            $('.p-count').html(res.Qty);
                            $('.price').html(res.ToTalPrice);
                        }

                    }
                })
            });
        });
        $('#del_cart').off('click').on('click', function () {
            $.ajax({
                url: 'Cart/DeleteAll',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        setTimeout(function () {
                            window.location.href = "/";
                        }, 500);
                        $('#empty-alert').delay(1000).show();
                        $('#empty-alert').delay(1000).fadeOut(500);
                    }
                }
            })
        });
        //$('#btnCheckOut').off('click').on('click', function () {
        //    window.location.href = "/checkout";
        //});
    }
}
cart.init();
function addCommas(nStr) { // pass value to function
    nStr += '';
    var x = nStr.split('.'); //split value with .
    var x1 = x[0];
    var x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) { //check  array first value with regular expression
        x1 = x1.replace(rgx, '$1' + ',' + '$2'); // add comma based on check
    }
    return x1 + x2 + " đ"; // return final value
}