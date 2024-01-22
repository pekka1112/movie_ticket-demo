var price = 50000; //price
$(document).ready(function() {
    var $cart = $('#selected-seats'), //Sitting Area
        $counter = $('#counter'), //Votes
        $total = $('#total'); //Total money

    var sc = $('#seat-map').seatCharts({
        map: [  //Seating chart
            'aa__aa__aa',
            'aaaaaaaaaa',
            '__________',
            'aaaaaaaaaa',
            'aaaaaaaaaa',
            'aaaaaaaaaa',
            'aaaaaaaaaa',
            'aaaaaaaaaa',
            'aaaaaaaaaa',
            'aa__aa__aa'
        ],
        naming : {
            top : false,
            getLabel : function (character, row, column) {
                return column;
            }
        },
        legend : { //Definition legend
            node : $('#legend'),
            items : [
                [ 'a', 'available',   'Còn trống' ],
                [ 'a', 'unavailable', 'Đã được đặt']
            ]
        },
        click: function () { //Click event
            if (this.status() == 'available') { //optional seat
                $('<li>R'+(this.settings.row+1)+' S'+this.settings.label+'</li>')
                    .attr('id', 'cart-item-'+this.settings.id)
                    .data('seatId', this.settings.id)
                    .appendTo($cart);

                $counter.text(sc.find('selected').length+1);
                $total.text(recalculateTotal(sc)+price);

                return 'selected';
            } else if (this.status() == 'selected') { //Checked
                //Update Number
                $counter.text(sc.find('selected').length-1);
                //update totalnum
                $total.text(recalculateTotal(sc)-price);

                //Delete reservation
                $('#cart-item-'+this.settings.id).remove();
                //optional
                return 'available';
            } else if (this.status() == 'unavailable') { //sold
                return 'unavailable';
            } else {
                return this.style();
            }
        }
    });
    //sold seat
    sc.get(['1_2', '4_4','4_5','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable');

});
//sum total money
function recalculateTotal(sc) {
    var total = 0;
    sc.find('selected').each(function () {
        total += price;
    });

    return total;
}