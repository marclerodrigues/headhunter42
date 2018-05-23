
User.create(first_name: 'Admin',
            last_name: 'Headhunter',
            role: 'admin',
            email: ENV['ADMIN_EMAIL'],
            password: ENV['ADMIN_PASSWORD'])

Company.create()
