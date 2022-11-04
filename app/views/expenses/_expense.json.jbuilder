json.extract! expense, :id, :name, :description, :icon, :amount, :created_at, :updated_at
json.url expense_url(expense, format: :json)
