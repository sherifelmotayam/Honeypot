from models.attacker import Attacker
import gender_guesser.detector as gender
from wordsegment import load, segment
import random
from faker import Faker

class FakeAccountGenerator:
    __attacker = Attacker()
    __detector = gender.Detector()
    __faker = Faker()
    __email = None
    __first_name = None
    __last_name = None
    __password = None
    __gender = None
    __name_male = [
        'Ahmed', 'Mohamed', 'Gamil', 
        'Mostafa', 'Khaled', 'AbuElenien',
        'Sherif', 'Elmotayam', 'Ali',
        'Amr', 'Fathy', 'Shaltout',
        'Kareem', 'Yasser', 'Razzaz',
        'Salama', 'Loay', 'Yehia',
        'Essam', 'Eliwa', 'Ayman',
        'Taha', 'Hazem', 'Hassan',
        'Hesham', 'Galal', 'Fares',
        'Alaa', 'Micheal', 'Mafdy',
        'Raheem', 'Youssef', 'Khalil', 'Malek', 
        'Hossam', 'Nabil', 'Ezzat',
        'Elias', 'Helmy', 'Samir',
        'Abbas', 'Shawky', 'Muslim',
        'Abdelrahman', 'Abduallah', 'Maraghy',
        'Wahba', 'Mohey', 'Sayed',
        'Abdelraouf', 'Shaheen', 'Magdy',
        'Ismaeel', 'Mekky', 'Antably',
        'Mahmoud', 'Zoair', 'Osama'
    ]

    def __init__(self, email):
        self.__email = email.lower()
        print("email: ", self.__email)
        self.__filter_email()

    def __filter_email(self):
        """remove from the @ till the end"""
        """
        input: Mostafa1810751@miuegypt.edu.eg
        output: Mostafa1810751
        """
        name = self.__email.split('@')[0]

        """free from numbers"""
        if(any(chr.isdigit() for chr in name)):
            name = ''.join([i for i in name if not i.isdigit()])
        
        print("name: ", name)
        name = name
        load()
        name = segment(name) #try to combine words from text
        """capitalize the first letter if small it is a must for the gender prediction"""
        name = name[0].capitalize()

        print("post name: ", name)
        self.__guess_gender(name)
        self.__generate_fake(name)
        
    def __guess_gender(self, name):
        self.__gender = self.__detector.get_gender(name)
        print(name, " is ", self.__gender)

    def __generate_fake(self, name):
        r_male = random.randint(0, len(self.__name_male))
        r_2_male = random.randint(0, len(self.__name_male))
        if("male" in self.__gender  or "female" in self.__gender): # last name is generated
            self.__first_name = name
            self.__last_name = self.__name_male[r_male]
        else: # both first and last name are generated
            while r_male == r_2_male: # if the firstname and the lastname was same
                r_male = random.randint(0, len(self.__name_male))
                r_2_male = random.randint(0, len(self.__name_male))
            self.__first_name = self.__name_male[r_male]
            self.__last_name = self.__name_male[r_2_male]
        self.__password = self.__faker.password()
        print("firstname: ", self.__first_name)
        print("lastname: ", self.__last_name)
        print("password: ", self.__password)
        """insert into the db"""
        self.__attacker.insert_account(self.__first_name, self.__last_name, self.__email, self.__password)
        

# if __name__ == "__main__":
#     model = FakeFNLNPSGenerator("amr.khaled64@gmail.com")


