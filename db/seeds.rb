
User.create(first_name: 'Admin',
            last_name: 'Headhunter',
            role: 'Admin',
            email: ENV['ADMIN_EMAIL'],
            password: ENV['ADMIN_PASSWORD'])

Company.create(name: 'Codeminer42',
               website: 'www.codeminer42.com',
               phone_number: '5542424242',
               address: 'Rua Demóstenes, 956, Campo Belo
São Paulo - SP - Brasil - CEP 04614-014',
               logo_id: "01"
               logo_filename: "cdn-images-1.medium.com/max/1200/1*d8nFYvy9vPnreEQvk5XY8Q.png"
               logo_content_size: "500"
               logo_content_type: "png")
