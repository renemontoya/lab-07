
# Lab 7 — VetClinic: Models, Migrations, and Seed Data

## System Description

Throughout the following labs, you will progressively build **VetClinic**: a web application for managing a veterinary clinic. By the end of the semester, you will have a fully functional application capable of handling the clinic's daily operations.

The application will allow clinic staff to:

- Register pet owners and their pets, keeping track of species, breed, and medical history.
- Manage the clinic's veterinarians with their specializations.
- Schedule and manage appointments between pets and veterinarians, including date, time, and reason for the visit.
- Record treatments administered during appointments, tracking the treatment type, medication, dosage, and clinical notes.
- Track appointment status through its lifecycle: scheduled, in progress, completed, and cancelled.

Across the labs, you will progressively implement:

- Data modeling with owners, pets, veterinarians, appointments, and treatments.
- Read-only views to browse and inspect records.
- Associations and validations to ensure data integrity and enforce business rules.
- CRUD operations with forms for all main entities.
- Rich text clinical notes using ActionText.
- Nested forms for managing treatments within an appointment.
- Authentication and authorization to restrict access based on user roles.
- Deployment to a cloud server.

## Objective

In this lab, you will set up the initial data model for VetClinic by creating all necessary models with their attributes and associations, and populating the database with sample data. **No validations are required in this lab** — those will be added in a future lab.

## Instructions

### 1. Create a New Rails Application

- Create a new Rails application called `vet_clinic` using **PostgreSQL** as the database.
- Make sure the application runs without errors before proceeding.

### 2. Create Models and Migrations

Generate the following models with the specified attributes. Do **not** add validations yet — those will come in a future lab.

**Owner**
- `first_name:string`
- `last_name:string`
- `email:string`
- `phone:string`
- `address:text`

**Pet**
- `name:string`
- `species:string`
- `breed:string`
- `date_of_birth:date`
- `weight:decimal`
- `owner_id:integer`

**Vet**
- `first_name:string`
- `last_name:string`
- `email:string`
- `phone:string`
- `specialization:string`

**Appointment**
- `pet_id:integer`
- `vet_id:integer`
- `date:datetime`
- `reason:string`
- `status:integer`

**Treatment**
- `appointment_id:integer`
- `name:string`
- `medication:string`
- `dosage:string`
- `notes:text`
- `administered_at:datetime`

Run the migrations to create all tables in the database.

### 3. Add Associations

Define the following associations in your models using `has_many` and `belongs_to`:

- An **Owner** has many **Pets**.
- A **Pet** belongs to an **Owner**.
- A **Pet** has many **Appointments**.
- A **Vet** has many **Appointments**.
- An **Appointment** belongs to a **Pet** and belongs to a **Vet**.
- An **Appointment** has many **Treatments**.
- A **Treatment** belongs to an **Appointment**.

### 4. Seed Data

Create a seed file (`db/seeds.rb`) with sample data for each table. Your seed file should include:

- At least 3 owners with different names and contact information.
- At least 5 pets distributed among the owners, with a mix of species (e.g., dog, cat, rabbit).
- At least 2 veterinarians with different specializations (e.g., general practice, surgery, dermatology).
- At least 5 appointments with different statuses. Use integer values for the status field (e.g., 0 for scheduled, 1 for in progress, 2 for completed, 3 for cancelled).
- At least 5 treatments linked to completed or in-progress appointments.

Use the associations to create related records in the seed file (e.g., `owner.pets.create(...)` or `Pet.create(owner: owner, ...)`).


## Deliverables

- A working Rails application with PostgreSQL.
- All five models created with the correct attributes and associations.
- All migrations applied successfully (`rails db:migrate`).
- Seed file populating meaningful sample data for all tables using associations (`rails db:seed`).
- Verify your data is correctly stored by checking it in the Rails console (`rails console`).
