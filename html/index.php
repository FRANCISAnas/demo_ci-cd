<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="shortcut icon" href="/img/favicon.png" type="image/x-icon" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
		<link rel="stylesheet" href="style.css" />
		<title>PRNG for password</title>
	</head>
	<body>
		<header>
			<div class="title">
				<h1>Генерація псевдо випадкових криптостійких паролів</h1>
				<p>
					Генерація псевдо випадкових криптостійких паролів на основі ентропії
					операційної системи на базі ядра Linux
				</p>
			</div>
		</header>
		<div class="form-output">
			<form action="" method="POST">
				<input type="submit" class="btn btn-success" value="Отримати пароль адміністратора" name="get_passwd" 	id="getPasswd"/>
			</form>
		</div>
		<div class="password-block">
			<p>Новий пароль:</p>		
			<?php include "get_password.php";?>
		</div>
		<div class="ip-block">
			<p>IP-addres:</p>		
			<?php echo $_SERVER['SERVER_ADDR']; ?>
		</div>

		
	</body>
</html>
