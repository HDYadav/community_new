$("#year").on("change", function (event) {
    
    let year_id = $(this).val();
     $('#scheduler').hide();

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: baseUrlAdmin + '/schedulers/months',
            method: "GET",
            data: {
                'year_id': year_id,
            },
            success: function (data) {
                
                $("#month_id").html(data.mhtml);
                localStorage.setItem("year_id", year_id);


                // if (data.status == true) {

                //     localStorage.setItem("year_id", year_id);

                //     var retrunData = '<option value="">--Select--</option>';
                //     data.data.map(
                //         (item) => {
                            
                //             retrunData += `<option value="${item.id}">${item.month}</option>`;
                //         }
                //     );
                //     // console.log(retrunData);
                //     $("#month_id").html(retrunData);

                // } else {
                //     swal({
                //         text: data.message,
                //         icon: "error",
                //     });
                // }
            }
        });
    });

    $("#month_id").on("change", function(event) {
        let month_id = $(this).val();
        let year_id = localStorage.getItem("year_id");

         console.log(year_id);
         
         $('#index_scheduler').show();  
        
      //  $('#scheduler').hide();
        
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: baseUrlAdmin + '/schedulers/days',
            method: "GET",
            data: {
                'month_id': month_id,'year_id': year_id,
            },
            success: function (data) {  
                $("#index_scheduler").html(data.html2);  
               

            }
        });
    });



    
    
     