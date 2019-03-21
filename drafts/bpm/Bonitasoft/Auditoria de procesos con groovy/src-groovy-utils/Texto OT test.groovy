//TODO hay que poner como segunda direccion en la orden de trabajo la direccion de la caixa...
// Eso es lo que debe entender el ITSM... Es posible que usemos type para decir eso...

def attributes = [
    'sales.reference' : '23434324',
    'service.bandwidth': '1024',
    'service.name': '222323231',
    'client.name': 'Manuel Matute Tute',
    'contact.name': 'El primo de Manuel',
    'contact.phone_number': '3335556',
    'username' : '222323231@angolatelecom.ao',
    'password' : 'ere5TGdfw',
    
    'inventory.pots.customerPair.id' : 'ere5TGdfw',
    'inventory.pots.customerPair.port' : 'ere5TGdfw',
    'inventory.pots.customerPair.status' : 'ere5TGdfw',

    'inventory.pots.dslam.id' : 'ere5TGdfw',    
    'inventory.pots.dslam.primaryPair.port' : 'ere5TGdfw',   
    'inventory.pots.dslam.rack.port': '',
    'inventory.pots.dslam.slot.port': '',
    'inventory.pots.dslam.port': '',
    'inventory.pots.cabinet.id': '',
    'inventory.pots.cabinet.primaryPair.port': '',
    'inventory.pots.cabinet.secondaryPair.port': '', 
    
    'inventory.pots.phoneNumber' : 'ere5TGdfw',
    'service.name' : 'ere5TGdfw',
    
    'inventory.ports.box.id' : 'ere5TGdfw',
    'inventory.ports.box.status' : 'ere5TGdfw',
    'inventory.ports.box.latitude' : 'ere5TGdfw',
    'inventory.ports.box.longitude' : 'ere5TGdfw',
    'inventory.ports.box.layout' : 'ere5TGdfw',
    'inventory.ports.box.primaryPair.port': '',
    
    'inventory.pots.mdf.id' : 'ere5TGdfw',
    'inventory.pots.mdf.ip' : 'ere5TGdfw',
    'inventory.pots.mdf.portIp' : 'ere5TGdfw',
    'inventory.pots.mdf.port.id' : 'ere5TGdfw',
    'inventory.pots.mdf.port.number' : 'ere5TGdfw',
]

def clientAddressText = """Calle pepe
        Pueblo luis
        Municipio xx
        Provincia YYY
        Pais este
        Latitude/Longitude  48.86723    2.34301"""

def localizacionCaixaText = """Localizaçao Poste
        Calle luis
        Pueblo luis
        Municipio xx
        Provincia YYY
        Pais este
        Latitude/Longitude  44.86723    2.34301"""


//TODO el nombre del cliente es mejor cogerlo del service description no de los atributes

def txt = """Ordem de Instalação linha de cobre

Referencia comercial: ${attributes.'sales.reference'}
Nome: ${attributes.'client.name'}
Endereço: ${clientAddressText}
Nome contato: ${attributes.'contact.name'}
Telefone de contato : ${attributes.'contact.phone_number'}
UserName: ${attributes.'username'}
Password: ${attributes.'password'}

Dados de instalação:
--------------------

DSLAM:                                     Par DSLAM:
ID Cabo:                                   Par Cabo:
ID Armario:                                Par Arm. Pri/Sec:
ID Caixa:                                  Par Caixa Pri/Sec:
Localização Caixa: ${localizacionCaixaText}
Número de telefone: ${attributes.'service.name'}
"""
//Caixa %nombrecaixa1%. Porto: %puerto1%. Número de telefone: %número_teléfono1%

println txt