def parse_line(line):
    'funcion para extraer informacion de una linea de texto, de archivo "datosuf.txt"'
    rawdata = [item.strip() for item in line.split()]
    
    #descompone info en partes
    mes = rawdata[0][:3]
    anio = int(rawdata[0][4:8])
    valor = float(rawdata[1].replace('.', '').replace(',', '.'))
    
    #guarda info importante
    data = (mes , anio, valor)
    return data
