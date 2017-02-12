defmodule TitleIxWaivers.ExAdmin.User do
  use ExAdmin.Register
  alias Phoenix.View

  register_resource TitleIxWaivers.User do
    filter except: [
      :password_hash,
      :reset_password_token,
      :reset_password_sent_at,
      :sign_in_count,
      :current_sign_in_at,
      :last_sign_in_at,
      :current_sign_in_ip,
      :last_sign_in_ip,
      :failed_attempts,
      :locked_at,
      :unlock_token,
      :updated_at,
    ]

    index do
      selectable_column

      column :username
      column :name
      column :email

      actions
    end

    show user do
      attributes_table do
        row :name
        row :username
        row :email
      end
    end

    form user do
      inputs "User Details" do
        input user, :username
        input user, :name
        input user, :email
        input user, :password
        input user, :password_confirmation
      end
    end
  end
end
