# -*- coding: utf-8 -*-
"""
Created on Sat Mar  4 23:18:11 2017

@author: luffy666
"""

import urllib2

fichier = open("/users/Etu6/3200386/M1DAC/BI/Projet_BI_DUA/Detenu_dans_le_monde.csv", "wb")
fichier.write("Pays"+";"+"NbDetenues"+";"+"Population")
fichier.write('\n')


url = urllib2.urlopen("https://fr.wikipedia.org/wiki/Liste_des_pays_par_population_carc%C3%A9rale")
listeBalise = []


data = ""
while(not(data.__contains__('</html>'))):
    data = url.readline()
    listeBalise.append(data)

listePays = []
listeDetenue = []
listePopulation = []
for i in range(0,len(listeBalise)):     
    if(listeBalise[i].__contains__('<td><span class="datasortkey" data-sort-value="')):
        if(not(listeBalise[i].__contains__('Maurice')) and not(listeBalise[i].__contains__('Corée du Nord'))):
            listePays.append(listeBalise[i])
            listeDetenue.append(listeBalise[i+5])
            listePopulation.append(listeBalise[i+8])
            i = i+8

listePaysbis = []
for i in range(0,len(listePays)):    
    start = listePays[i].find('value')+6
    end = listePays[i].find('>',start)
    listePaysbis.append(listePays[i][start:end])

listeDetenuebis = []    
for i in range(0,len(listeDetenue)):    
    start = listeDetenue[i].find('>')+1
    end = listeDetenue[i].find('<',start)
    listeDetenuebis.append(listeDetenue[i][start:end])

listePopulationbis = []        
for i in range(0,len(listePopulation)):    
    start = listePopulation[i].find('>')+1
    end = listePopulation[i].find('<',start)
    listePopulationbis.append(listePopulation[i][start:end])


for i in range(0,len(listePaysbis)):
    fichier.write(listePaysbis[i]+';'+listeDetenuebis[i]+';'+listePopulationbis[i])
    fichier.write('\n')  
    
fichier.close()
url.close()



