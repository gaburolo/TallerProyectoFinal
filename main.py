import os
import sys
table=""

def createMem(label, table):
    cont=0
    for i in label:
        if (len(label)-1)>cont:
            table=table+str(i)+"\n"
        else:
            table=table+str(i)
    
        cont+=1
    return table

def ascii_convert(text):
    ascii_values = []
    for character in text:
        ascii_values.append(ord(character))
    return ascii_values

def file_Mem(text):
    path = os.path.join(sys.path[0]+'\\simulation\\modelsim\\rom.mem')
    with open('rom.mem', 'w') as f:
        f.write(text)
        f.close()
    with open(path, 'w') as f2:
        f2.write(text)
        f2.close()
text = input("Digite la frase:")
textAscii=[]
textAscii=ascii_convert(text)
table = createMem(textAscii, table)
finalText=table
file_Mem(finalText)
print(finalText)
