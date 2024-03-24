document.addEventListener('DOMContentLoaded', function() {
    var buttons = document.querySelectorAll('.btn.show_hide');

    buttons.forEach(function(button) {
        var img = button.querySelector('img');

        img.addEventListener('click', function(event) {
            if (img.getAttribute('src') === 'img/eye.png') {
                img.setAttribute('src', 'img/hide.png');

                var parentDiv = button.closest('.form_item.lock.password');

                var inputs = parentDiv.getElementsByTagName('input');

                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].type === 'password') {
                        inputs[i].type = 'text';
                    }
                }
            } else {
                img.setAttribute('src', 'img/eye.png');

                var parentDiv = button.closest('.form_item.lock.password');

                var inputs = parentDiv.getElementsByTagName('input');

                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].type === 'text') {
                        inputs[i].type = 'password';
                    }
                }
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function() {
    var pswd1Input = document.getElementById('pswd1');
    var pswd2Input = document.getElementById('pswd2');
    var pswdMsg = document.getElementById('pwdMsg');
    var nextButton = document.getElementById('next_btn');

    pswd1Input.addEventListener('blur', function(event) {
        validatePassword(pswd1Input, pswd2Input, pswdMsg);
    });

    pswd2Input.addEventListener('blur', function(event) {
        validatePassword(pswd1Input, pswd2Input, pswdMsg);
    });

    function validatePassword(pswd1Input, pswd2Input, pswdMsg) {
        var pswd1 = pswd1Input.value.trim();
        var pswd2 = pswd2Input.value.trim();

        var strongRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;

        if (pswd1 === '' || pswd2 === '') {
            displayErrorMessage("비밀번호를 입력해주세요", "14px", 'red', pswdMsg);
            nextButton.disabled = true; 
        } else if (!strongRegex.test(pswd1) || !strongRegex.test(pswd2)) {
            displayErrorMessage("비밀번호는 8~16자의 영문 대/소문자, 숫자, 특수문자를 사용해야 합니다.", "14px", 'red', pswdMsg);
            nextButton.disabled = true; 
        } else if (pswd1 !== pswd2) {
            displayErrorMessage("비밀번호가 일치하지 않습니다", "14px", 'red', pswdMsg);
            nextButton.disabled = true; 
        } else {
            hideErrorMessage(pswdMsg);
            nextButton.disabled = false;
        }
    }

    function displayErrorMessage(message, fontSize, color, pswdMsg) {
        pswdMsg.style.display = 'block';
        pswdMsg.innerHTML = message;
        pswdMsg.style.color = color;
        pswdMsg.style.fontSize = fontSize;
        pswd1Input.style.border = '1px solid ' + color;
        pswd2Input.style.border = '1px solid ' + color;
    }

    function hideErrorMessage(pswdMsg) {
        pswdMsg.style.display = 'none';
        pswd1Input.style.border = '1px solid green';
        pswd2Input.style.border = '1px solid green';
    }
});
