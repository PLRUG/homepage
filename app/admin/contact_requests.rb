# frozen string_literal: true
ActiveAdmin.register ContactRequest do
  config.clear_action_items!
  permit_params :email, :name, :message

  index do
    selectable_column
    column :email
    column :name
    column :message
    column :created_at
    actions
  end
end
