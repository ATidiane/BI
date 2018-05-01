# -*- coding: utf-8 -*-
"""
Created on Sun Mar  5 13:46:16 2017

@author: luffy666
"""

import urllib2

fichier = open("/home/luffy666/S2 DAC/BI/Projet_BI_DUA/CSV/PIB_dans_le_monde.csv", "wb")
fichier.write("Pays"+";"+"PIB")
fichier.write('\n')

url = urllib2.urlopen("https://fr.wikipedia.org/wiki/Liste_des_pays_par_PIB_nominal")
listeBalise = []

data = ""
while(not(data.__contains__('</html>'))):
    data = url.readline()
    listeBalise.append(data)
    
listePays = []
listePIB = []    
for i in range(0,len(listeBalise)):
    if(listeBalise[i].__contains__('<span class="datasortkey"')):
        if(not(listeBalise[i].__contains__('Maurice')) and not(listeBalise[i].__contains__('Corée du Nord'))):
            listePays.append(listeBalise[i])
            listePIB.append(listeBalise[i+1])
            i = i+1
            


listePaysbis = []
for i in range(0,len(listePays)):    
    start = listePays[i].find('value')+6
    end = listePays[i].find('>',start)
    listePaysbis.append(listePays[i][start:end])
    
listePIBbis = []    
for i in range(0,len(listePIB)):    
    start = listePIB[i].find('>')+1
    end = listePIB[i].find('<',start)
    chaine =  listePIB[i][start:end].replace(" ","")
    listePIBbis.append(chaine.replace(",","."))


for i in range(0,len(listePaysbis)):
    fichier.write(listePaysbis[i]+';'+listePIBbis[i])
    fichier.write('\n')  

print listePIBbis


fichier.close()
url.close()