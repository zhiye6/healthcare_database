# Healthcare Database

## Problem Statement
The COVID-19 pandemic has caused an unpredictable increase in data for the
field of medicine. With tens of millions coronavirus cases worldwide, medical databases
are overflowing and hospitals are needing more databases to store essential patient
and medical staff information. It’s crucial that this data is not lost and securely managed
to organize, analyze, and report pertinent information that will aid hospitals in providing
quality care.
Many hospitals are receiving additional pressure from the federal government to
report complete COVID-19 data into their federal data collection system. If they don’t
comply, hospitals could potentially lose federal Medicare and Medicaid funding. In order
to avoid this issue, it’s vital for hospitals to acquire high quality databases promptly to
store and transfer high volumes of data from one system to another.

## Description
In response to the COVID-19 pandemic, I led a team of 4 to creatd a medical database
that can be used in hospitals to manage information between medical staff and patients.
The typical users would be doctors, nurses, patients, and administrators, where the
database will primarily focus on patients. By utilizing the data within our database, our
users will be able to store and query information regarding the hospital, staff,
appointments, symptoms, diagnosis, procedures, labs, patients, contact information,
insurance, prescriptions, orders, medicines, messages, etc. Each of these entities are
centered around patients, in which they are able to seek accessible and reliable medical
attention by messaging the medical staff about specific or general health questions,
order prescriptions online, and schedule appointments to meet in-person or virtually.
From these interactions, we anticipate that there will be millions of transactions, given
the volume of patients and medical staff within a hospital.
For the business rules of our medical database, we established that
appointments scheduled cannot be prior to the current date, a patient cannot schedule
appointments with time conflicts, and a medical staff will have one staff position and
work at only one hospital. Additionally, phone numbers must be checked to follow the
pattern of xxx-xxx-xxxx, zip codes must be checked to follow the pattern of xxxxx or
xxxxx-xxxx, and the name of every medicine and hospital must be unique. Furthermore,
once a prescription runs out of refills or goes past the expiration date, there must be a
doctor authorization before a new prescription can be ordered. Moreover, labs must be
done following an appointment and the patient messages can only be sent to the
designated recipient (i.e. the doctor, the nurse, etc.). Lastly, in order to secure our
database from threats, we will deny and grant features for entity specific permissions.