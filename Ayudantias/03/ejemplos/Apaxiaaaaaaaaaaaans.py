nombre = input("Por favor escriba algo...")
corregido = ""
anterior = ""
for character in nombre:
	character = str(character)
	if character != anterior:
		corregido += anterior
		anterior = character
corregido += anterior
print(corregido)