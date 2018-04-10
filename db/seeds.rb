
User.create(first_name: 'Admin',
            last_name: 'Headhunter',
            email: ENV['ADMIN_EMAIL'],
            password: ENV['ADMIN_PASSWORD'])
