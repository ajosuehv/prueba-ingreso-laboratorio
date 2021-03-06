class CreateEstudiantes < ActiveRecord::Migration[5.1]
  def change
    create_table :estudiantes do |t|
      t.string :nombre
      t.string :ncuenta
      t.string :correo_electronico
      t.float :exact_sigma
      t.float :exact_mean
      t.float :real_sigma
      t.float :real_mean
      t.decimal :seed
      t.text :data
      t.timestamps
    end
  end
end
