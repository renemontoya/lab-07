require 'open-uri'

puts "Limpiando base de datos..."
Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Vet.destroy_all
Owner.destroy_all

puts "Creando Owners..."
owner1 = Owner.create!(first_name: "Carlos", last_name: "Pinto", email: "carlos@mail.com", phone: "987654321", address: "Av. Siempre Viva 123")
owner2 = Owner.create!(first_name: "Maria", last_name: "Gomez", email: "maria@mail.com", phone: "912345678", address: "Calle Falsa 456")

puts "Creando Vets..."
vet1 = Vet.create!(first_name: "Ana", last_name: "Rojas", email: "ana.vet@clinic.com", phone: "944444444", specialization: "General Practice")

puts "Creando Pets..."
pets_data = [
  { 
    name: "Firulais", 
    species: "dog", 
    breed: "Quiltro", 
    weight: 15.5, 
    date_of_birth: "2019-05-10", # Agregado
    owner: owner1, 
    img: "https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?q=80&w=500&auto=format&fit=crop" 
  },
  { 
    name: "Pelusa", 
    species: "cat", 
    breed: "Persian", 
    weight: 4.2, 
    date_of_birth: "2020-08-20", # Agregado
    owner: owner2, 
    img: "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?q=80&w=500&auto=format&fit=crop" 
  }
]

pets_data.each do |data|
  pet = Pet.new(data.except(:img))
  begin
    file = URI.open(data[:img])
    pet.photo.attach(io: file, filename: "#{data[:name]}.jpg", content_type: "image/jpeg")
  rescue => e
    puts "No se pudo cargar la foto para #{data[:name]}: #{e.message}"
  end
  pet.save!
  puts "Mascota #{pet.name} creada correctamente."
end

puts "Creando Appointments..."
# Usamos .first porque ya sabemos que existe Firulais
app1 = Appointment.create!(pet: Pet.first, vet: vet1, date: DateTime.now - 2.days, reason: "Annual checkup", status: :completed)

puts "Creando Treatments con Action Text..."
Treatment.create!(
  appointment: app1, 
  name: "General Checkup", 
  administered_at: DateTime.now - 2.days,
  clinical_notes: "<h1>Reporte Médico</h1><p>El paciente se encuentra en <b>excelente estado</b>.</p><ul><li>Peso estable</li><li>Pelaje brillante</li></ul>"
)

puts "¡Listo! Todo cargado."