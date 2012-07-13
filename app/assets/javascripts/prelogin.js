/**
 * Muestra la capa de signin y signup
 * con el form de signin visible.
 */
function showForm() {
	$('#signin_signout').css('height','150px');
	$('#signin').show();
	$('#signin_signout').slideToggle();	
}

/**
 * Muestra el formulario de signin.
 */
function showSignin() {
	$('#signin_signout').css('height','150px');
	$('#signin').show('fold');
}

/**
 * Muestra el formulario de signup.
 */
function showSignup() {
	$('#signin_signout').css('height','205px');
	$('#signin').hide('fold');
}