class CommandLineInterface

    # show welcome message
    def greet
        puts <<-MULTILINE


        Welcome to the Onigiri order app!
        ▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△▼△▼


            MULTILINE
     end

    # Error message template
     def error_message
        puts "                     "
        puts "Please enter a valid number!"
     end


    # get user name
    def login
        puts <<-MULTILINE
           Please enter your user name.

        MULTILINE
        user_name = gets.chomp

        puts <<-MULTILINE

        Hi #{user_name}, what would you like to order?

        MULTILINE

        user_name
    end


    def ask_user_what_they_want
        puts <<-MULTILINE

   1: Choose from our menu    2: Make your own onigiri
   ────────────────────────   ─────────────────────────

        MULTILINE
        answer = gets.chomp

        # Error check
        if answer != "1" && answer != "2"
            error_message
            ask_user_what_they_want
        else answer
        end
    end

    # show all the combinations
    def list_all_combinations
            puts "                                    "
            puts "        Which onigiri are you interested in?"
            puts "                                    "
            puts "            +++++++++++ MENU +++++++++++"
            Order.first(5).each do |title|
                puts "              #{title.id}. #{title.name}"
            end
            puts "            ++++++++++++++++++++++++++++"
    end

    def choose_from_menu
        # get user input
        order_id = gets.chomp

        # Error check
        if order_id != "1" && order_id != "2" && order_id != "3" && order_id != "4" && order_id != "5"
            #Error
            error_message
            choose_from_menu
        else
            #Success
            selected_menu_name = Order.find_by(id: order_id).name
            puts "                                    "
            puts "Your choice => #{selected_menu_name}!"

            selected_rice_id = Order.find_by(id: order_id).rice_id
            rice_in_the_menu= Rice.find_by(id: selected_rice_id).name

            selected_filling_id = Order.find_by(id: order_id).filling_id
            filling_in_the_menu= Filling.find_by(id: selected_filling_id).name

            selected_menu_price = Order.find_by(id: order_id).total_price

            puts "Detail: #{rice_in_the_menu} & #{filling_in_the_menu} ($#{selected_menu_price})"
            puts "                                   "
            puts "Thank you for your order!"
        end

    end


    # allow users to make their original onigiri
    # user will select their favorite rice and filling


    def select_rice
        puts "                               "
        puts "Choose your favorite rice type to get started."
        puts "+++++++++++ Rice Types +++++++++++"
        Rice.all.each do |rice|
            puts "#{rice.id}. #{rice.name}: $#{rice.price}"
        end
        puts "++++++++++++++++++++++++++++"

        rice_id = gets.chomp

        if rice_id != "1" && rice_id != "2" && rice_id != "3" && rice_id != "4" && rice_id != "5" && rice_id != "6"
            #Error
            error_message
            select_rice
        else
            selected_rice_name = Rice.find_by(id: rice_id).name
            puts "Your choice: #{selected_rice_name}"
            rice_id
        end

    end

    def select_filling
        puts "                               "
        puts "Next, choose your favorite filling"
        puts "+++++++++++ Fillings +++++++++++"
        Filling.all.each do |filling|
            puts "#{filling.id}. #{filling.name}: $#{filling.price}"

        end
        puts "++++++++++++++++++++++++++++"
        # binding.pry
        filling_id = gets.chomp
        if filling_id != "1" && filling_id != "2" && filling_id != "3" && filling_id != "4" && filling_id != "5" && filling_id != "6" && filling_id != "7" && filling_id != "8"
        #Error
            error_message
            select_filling
        else
            selected_filling_name = Filling.find_by(id: filling_id).name
            puts "Your choice: #{selected_filling_name}"
            filling_id
        end
    end

    def name_order
        puts "                                 "
        puts "What do you name this combination?"
        new_name = gets.chomp
    end

    def create_new_combination(selected_rice, selected_filling, new_name, user_name)
        price = Rice.find_by(id: selected_rice).price + Filling.find_by(id: selected_filling).price
        Order.create(name: new_name, rice_id: selected_rice, filling_id: selected_filling, total_price: price, user_name: user_name)
        puts "                                         "
        puts "Total price for #{new_name} is $#{price}."
        puts "Thank you for your order!"
    end

    def confirm_order(new_name)
        puts "                               "
        puts "Do you want to save this combination?"
        puts "#{new_name}"
        puts "                   "
        puts "1. Yes, save it    2. Yes, but I want to edit name     3. No, delete it"
        confirm_answer = gets.chomp
          if confirm_answer != "1" && confirm_answer != "2" && confirm_answer != "3"
        #Error
            error_message
            confirm_order(new_name)
        else
            confirm_answer
        end

    end


    def edit_name(new_name)
        puts "Enter new name for this combination."
        order = Order.find_by(name: new_name)
        edited_name = gets.chomp
        order.update(:name => edited_name)
    end

    def save_message
        puts "                               "
        puts "We saved your data. See you soon!"
    end

    def delete_order_data(new_name)
        target_order = Order.find_by(name: new_name)
        target_order.delete
        puts "                               "
        puts "We deleted your combination. See you soon!"
    end


    def run
        greet
        user_name = login
        reply = ask_user_what_they_want
            if reply == "1"
                list_all_combinations
                choose_from_menu
            elsif reply == "2"
                selected_rice = select_rice
                selected_filling = select_filling
                new_name = name_order
                create_new_combination(selected_rice, selected_filling, new_name, user_name)
                user_reply = confirm_order(new_name)
                    if user_reply == "1"
                        save_message
                    elsif user_reply == "2"
                        edit_name(new_name)
                        save_message
                    elsif user_reply =="3"
                        delete_order_data(new_name)
                    end
            end
        end

end
