$("form").submit(function (e) {
	e.preventDefault();

	$.ajax({
		type: "POST",
		url: "get_password.php",
		datatype: "text",
		data: { enter: $("#getPasswd").val() },
		success: function (data) {
			console.log(data);
		},
	});
});
