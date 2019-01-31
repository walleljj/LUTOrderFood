/**
 * Created by ttssiw on 2017/1/16.
 */
$(function(){
    $(window).scroll(function(){
        if($(document).scrollTop()>=350){
            $('.store_action_right_cart').css({position:'fixed',top:'200px'});
        }else{
            $('.store_action_right_cart').css({position:'absolute',top:'300px'});
        }
    })
})

$('.reduc').click(function(){
    var value=$(this).next('input').val();
    if(value>1){
        value--;
        $(this).next('input').val(value);
    }
});
$('.add').click(function(){
    var value=$(this).prev('input').val();
    value++;
    $(this).prev('input').val(value);
    
});
function total(){
    var total=parseFloat(0.00);
    $('.store_action_right_cart_content>div.addtion').each(function(){
        var op=parseFloat($(this).find('.cart_unit_price').text());
        total+=op;
    })
    $('.total_price span').html(total.toFixed(2));
}

$('.store_action_right_cart_content').delegate('.cart_reduc','click',function(){
    var numone=parseFloat($(this).next('input').val());
    numone-=1;
    if(numone==0){
        $(this).parent().parent().remove();
    }
    if(numone>=1){
        $(this).next('input').val(numone);
        var id=$(this).parent().parent().attr('id');
        var this_price=$('.salc_content').find("#"+id).find('.price').text();
        var new_this_price=numone*this_price;
        $(this).parent().next('span').find('.cart_unit_price').html(new_this_price.toFixed(2));
    }
    update();
});
$('.store_action_right_cart_content').delegate('.cart_add','click',function(){
    var numtwo=parseFloat($(this).prev('input').val());
    numtwo+=1;
    $(this).prev('input').val(numtwo);
    var id=$(this).parent().parent().attr('id');
    var this_price=$('.salc_content').find("#"+id).find('.price').text();
    var new_this_price=numtwo*this_price;
    $(this).parent().next('span').find('.cart_unit_price').html(new_this_price.toFixed(2));
    update();
})

function update(){
    var update_total=parseFloat(0.00);
    $('.store_action_right_cart_content>div.addtion').each(function(){
        var tp=parseFloat($(this).find('.cart_unit_price').html());
        update_total+=tp;
    })
    $('.total_price>span').html(update_total.toFixed(2));
}

$('.clear').click(function(){
    $('.addtion').remove();
    var clear_total=0;
    $('.total_price>span').text(clear_total.toFixed(2));
})
