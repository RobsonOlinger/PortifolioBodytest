import     psycopg2
from logging    import info



class DeloreanLibrary():

    def connect(self):
            return psycopg2.connect(
            host='ec2-34-225-66-116.compute-1.amazonaws.com',
            database='d3ql3087dboum1',
            user='hdukwglkiuhijb',
            password='af26027176934a41ef22e592dc84eecbf6a9d7246ff648cdbad757cf81a0ecbf'
        )

    # No Robot vira uma KW automáticmanete => Remove Students  email@desejado.com
    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)
        info(query)


        conn = self.connect()
        

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()


    
    
    def remove_student_by_name(self, name):

        # LIKE '%{}%' permite remover um nome especifico
        query = "delete from students where name LIKE '%{}%'".format(name)
            
        info(query)

       
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()





    def insert_student(self, student):

        self.remove_student(student['email'])

        query = ("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
            "values('{}','{}',{},{},{},NOW(),NOW());"
            .format(student['name'], student['email'],student['age'],student['weight'],student['feet_tall']))

        info(query)


        conn = self.connect()
        

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()


##################### PLANOS ##################################################################################################

    def remove_plan(self,):

        query = "delete from plans"
        info(query)


        conn = self.connect()
        

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()


    
    
    def remove_plan_by_title(self, title):

        # LIKE '%{}%' permite remover um nome especifico
        query = "delete from plans where title LIKE '%{}%'".format(title)
            
        info(query)

       
        conn = self.connect()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()





    def insert_plan(self, plan):

        self.remove_plan_by_title(plan['title'])

        query = ("insert into plans (title, duration, price, created_at, updated_at)"
            "values ('{}',{},{},NOW(), NOW());"
            .format(plan['title'], plan['duration'],plan['price']))

        info(query)


        conn = self.connect()
        

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()


   


    
    