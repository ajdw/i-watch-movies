// Toggle between fa-eye and fa-eye-slash once you click #seen

const seenSound = new Audio("../assets/audio/sound72.wav");

$(function() {
	$(".seen").click(function() {
		seenSound.play()
		$(this).toggleClass("fa-eye fa-eye-slash");
	});
});
ui