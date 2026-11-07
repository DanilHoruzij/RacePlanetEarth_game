extends RigidBody2D # Указываем, что этот код упровляет нашей машиной

var wheels = [] # Создаем список, куда соберутся все колеса машины
var speed = 60000 #  Задаем силу вращения колес
var max_speed = 50 # Задаем максимальную скорость вращения колес, чтобы ограничить скорость машины


func _ready(): # Функция срабатывает один раз пристарте игры
	wheels = get_tree().get_nodes_in_group("wheel") # ищем все объекты, которые мы добавили в группу whill

func _physics_process(delta): # Функция работает каждый кадр и отвечает за физику и за упровление
	if Input.is_action_pressed("ui_right"): # Проверка нажата ли правая стрелка 
		for wheel in wheels: # Запускаем цикл проверки каждого колеса
			if wheel.angular_velocity < max_speed: # Проверяем, не привысили ли колеса лимит скорости
				wheel.apply_torque_impulse(speed * delta * 60) # Если не привысили то ускоряем колесо 

	if Input.is_action_pressed("ui_left"): # Проверка нажата ли левая стрелка
		for wheel in wheels: # Запускаем цикл проверки каждого колеса
			if wheel.angular_velocity > -max_speed: #  Проверяем, так же лимит в противоположную сторону
				wheel.apply_torque_impulse(-speed * delta * 60) # Если не привысили то ускоряем колесо


