json.extract! expense_detail, :id, :name, :amount, :expense_id, :created_at, :updated_at
json.url expense_detail_url(expense_detail, format: :json)
