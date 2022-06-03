
function validate() {
    let myForm = document.forms['contactform']
    message = ''

    if (myForm['name'].value == '') {
    message += 'Please insert your name\n'}
    if (typeof(myForm['name'].value) === 'number') {
    message += 'Please insert your name\n'}
    if (myForm['email'].value == '') {
    message += 'Please insert your e-mail\n'}
    if (myForm['mesaj'].value == '') {
    message += 'Message can not be null\n'}
    if (message != '') {
    alert(message)}
    else { alert('Thank you for your message')}
}

