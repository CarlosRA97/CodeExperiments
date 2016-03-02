from ftplib import FTP

ftp = FTP('rp1carlosra97.ddns.net').login(user = 'CarlosRA97', passwd = 'crakpkp06061997')

def grabFile():
     filename = 'example.txt'

     localfile = open(filename, 'wb')
     ftp.retrbinary('RETR' + filename, localfile.write, 1024)

     ftp.quit()
     localfile.close()

def placeFile():

    filename = 'exampleFile.txt'
    ftp.storbinary('STOR' + filename, open(filename, 'rb'))
    ftp.quit()

placeFile()
