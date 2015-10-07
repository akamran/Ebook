var masterController = {
    ResetForm: function (formid) {
        document.getElementById(formid).reset();
        return false;
    },
    validateMultipleEmailsCommaSeparated: function (emailcntl, seperator)
    {
       
        var value = emailcntl.value;
        if (value != '') {
            var result = value.split(seperator);
            for (var i = 0; i < result.length; i++) {
                if (result[i] != '') {
                    if (!masterController.validateEmail(result[i])) {
                        emailcntl.focus();
                        alert('Please check, `' + result[i] + '` email addresses not valid!');
                        return false;
                    }
                }
            }
        }
        return true;
    },
    validateEmail: function (field)
    {
       
        var regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,5}$/;
        return (regex.test(field)) ? true : false;
    },
    AjaxLoading:function()
    {
       $(".loading").show();
    
    },
    AjaxFinish:function(){
      $(".loading").fadeOut();
    }

}
