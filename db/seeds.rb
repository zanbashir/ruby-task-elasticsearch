file_path = Rails.root.join('db/')
files_name = %w[verticals categories courses]
::Verticals::Imports::Verticals.call!(file_path: file_path, files_name: files_name)
