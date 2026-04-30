puts "Limpia."
Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

puts "Creando Owners..."
owner1 = Owner.create!(first_name: "Carlos", last_name: "Pinto", email: "carlos@mail.com", phone: "987654321", address: "Av. Siempre Viva 123")
owner2 = Owner.create!(first_name: "Maria", last_name: "Gomez", email: "maria@mail.com", phone: "912345678", address: "Calle Falsa 456")
owner3 = Owner.create!(first_name: "Luis", last_name: "Soto", email: "luis@mail.com", phone: "955555555", address: "Pasaje Los Pinos 789")

puts "Creando Vets..."
vet1 = Vet.create!(first_name: "Ana", last_name: "Rojas", email: "ana.vet@clinic.com", phone: "944444444", specialization: "General Practice")
vet2 = Vet.create!(first_name: "Pedro", last_name: "Silva", email: "pedro.vet@clinic.com", phone: "933333333", specialization: "Surgery")

puts "Creando Pets..."
# OJO: Se cambiaron a minúsculas ("dog", "cat", "rabbit") para pasar la validación del Lab 5
pet1 = Pet.create!(name: "Firulais", species: "dog", breed: "Quiltro", date_of_birth: "2019-05-10", weight: 15.5, owner_id: owner1.id)
pet2 = Pet.create!(name: "Pelusa", species: "cat", breed: "Persian", date_of_birth: "2020-08-20", weight: 4.2, owner_id: owner1.id)
pet3 = Pet.create!(name: "Tambor", species: "rabbit", breed: "Angora", date_of_birth: "2022-01-15", weight: 1.8, owner_id: owner2.id)
pet4 = Pet.create!(name: "Rex", species: "dog", breed: "German Shepherd", date_of_birth: "2018-11-05", weight: 30.0, owner_id: owner2.id)
pet5 = Pet.create!(name: "Michi", species: "cat", breed: "Siamese", date_of_birth: "2021-03-30", weight: 3.5, owner_id: owner3.id)

puts "Creando Appointments..."
# Los números 0, 1, 2, 3 funcionan perfecto porque automáticamente se mapean a tu Enum
app1 = Appointment.create!(pet_id: pet1.id, vet_id: vet1.id, date: DateTime.now - 2.days, reason: "Annual checkup", status: 2)
app2 = Appointment.create!(pet_id: pet2.id, vet_id: vet1.id, date: DateTime.now - 1.day, reason: "Vaccination", status: 2)
app3 = Appointment.create!(pet_id: pet3.id, vet_id: vet2.id, date: DateTime.now, reason: "Stomach pain", status: 1)
app4 = Appointment.create!(pet_id: pet4.id, vet_id: vet2.id, date: DateTime.now + 2.days, reason: "Surgery prep", status: 0)
app5 = Appointment.create!(pet_id: pet5.id, vet_id: vet1.id, date: DateTime.now + 5.days, reason: "Flea treatment", status: 3)

puts "Creando Treatments..."
Treatment.create!(appointment_id: app1.id, name: "General Checkup", medication: "None", dosage: "N/A", notes: "Dog is healthy.", administered_at: DateTime.now - 2.days)
Treatment.create!(appointment_id: app2.id, name: "Rabies Vaccine", medication: "Rabies Vax", dosage: "1 ml", notes: "No adverse reaction.", administered_at: DateTime.now - 1.day)
Treatment.create!(appointment_id: app2.id, name: "Feline Leukemia", medication: "FeLV Vax", dosage: "1 ml", notes: "Right leg.", administered_at: DateTime.now - 1.day)
Treatment.create!(appointment_id: app3.id, name: "Ultrasound", medication: "None", dosage: "N/A", notes: "Pending results.", administered_at: DateTime.now)
Treatment.create!(appointment_id: app3.id, name: "Pain Relief", medication: "Meloxicam", dosage: "0.5 mg", notes: "Given for pain.", administered_at: DateTime.now)

puts "Listo"