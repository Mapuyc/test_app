jQuery.validator.addMethod('answercheck', function (value, element) {
        return this.optional(element) || /^\bcat\b$/.test(value);
    }, "type the correct answer -_-");

// validate post form
$(function() {
    $('.submit_form').validate({
        rules: {
            
            body: {
                required: true
            }
        },
        messages: {
          
            body: {
                required: "um...yea, you have to write something.",
                minlength: "thats all? really?"
            },
            answer: {
                required: "sorry, wrong answer!"
            }
        },
        submitHandler: function(form) {
            $(form).ajaxSubmit({
                type:"POST",
                data: $(form).serialize(),
                url:$(this).attr("action"),
                success: function() {
                    $('.submit_form :input').attr('disabled', 'disabled');
                    $('.submit_form').fadeTo( "slow", 0.15, function() {
                        $(this).find(':input').attr('disabled', 'disabled');
                        $(this).find('label').css('cursor','default');
                        $('#success').fadeIn();
                    });
                },
                error: function() {
                    $('.submit_form').fadeTo( "slow", 0.15, function() {
                        $('#error').fadeIn();
                    });
                }
            });
        }
    });
});
