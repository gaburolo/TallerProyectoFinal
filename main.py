import os
import sys
table=""
register="""00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000
00000000"""
def createMem(label, table):
    cont=0
    for i in label:
        table=table+str(i)+"\n"
        cont+=1
    print(table)
    while(cont<120):
        if 120!=cont:
            table=table+str(20)+"\n"
        else:
            table=table+str(20)
        cont+=1
   
    return table

def ascii_convert(text):
    ascii_values = []
    value=""
    for character in text:
        value=format(ord(character),"x")
        ascii_values.append(value)
    return ascii_values

def file_Mem(text):
    path = os.path.join(sys.path[0]+'\\simulation\\modelsim\\rom.mem')
    path_reg = os.path.join(sys.path[0]+'\\simulation\\modelsim\\regData.mem')
    with open('rom.mem', 'w') as f:
        f.write(text)
        f.close()
    with open(path, 'w') as f2:
        f2.write(text)
        f2.close()
    with open('regData.mem', 'w') as f:
        f.write(register)
        f.close()
    with open(path_reg, 'w') as f2:
        f2.write(register)
        f2.close()
    


    
text = input("Digite la frase:")
textAscii=[]
textAscii=ascii_convert(text.upper())
table = createMem(textAscii, table)
finalText=table
file_Mem(finalText)


