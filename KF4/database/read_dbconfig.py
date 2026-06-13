#read_dbconfig.py
from configparser import ConfigParser 

def read_db_config(filename= 'database/database_config.ini', section='mysql'):
    """ Reads database configuration file and returns a dictionary object
    :param filename: the name of database configuration file
    :param section: section of database configuration file
    :return: a dictionary whose database parameters
    """
    # Creates parser and reads database_config.ini
    parser = ConfigParser()
    parser.read(filename)
    # Reads section, its default is mysql
    db = {}
    if parser.has_section(section):
            arr_item = parser.items(section)
            for item in arr_item:
                    db[item[0]] = item[1]
    else:
            raise Exception('{0} is not found in file {1}'.format(section, filename))
    return db
