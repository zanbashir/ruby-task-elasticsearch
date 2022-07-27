module Verticals
  module Imports
    class Verticals
      include BaseInteractor

      expects :file_path
      expects :files_name

      def call
        extract_all_files
        import_verticals_data
        # Can be Add logic for shift to Batches in case data is large
        # YieldInBatches.call(collection: verticals, block: ->(batch) { import_verticals_data })
      end

      private

      def import_verticals_data
        verticals.each do |vertical|
          vertical(vertical)

          build_vertical_params

          categories.each do |category|
            category(category)
            build_category_params if category['Verticals'] == vertical['Id']
          end

          puts '*****'*8
          puts "**** ===> #{json_params}"
          puts '*****'*8
          Api::V1::Verticals::Create.run(params: json_params)
        end
      end

      def extract_all_files
        @verticals, @categories, @courses = files_name.map { |file_name|
          path = file_path + "#{file_name}.json"
          JSON.parse(File.read(path))
        }
      end

      def verticals
        @verticals
      end

      def json_params
        @json_params
      end

      def categories
        @categories
      end

      def courses
        @courses
      end

      def vertical(vertical = nil)
        vertical.nil? ? @vertical : @vertical = vertical
      end

      def category(category = nil)
        category.nil? ? @category : @category = category
      end

      def course(course = nil)
        course.nil? ? @course : @course = course
      end

      def build_vertical_params
        @json_params = ActionController::Parameters.new({
                                                          vertical: {
                                                            name: vertical['Name'],
                                                            categories_attributes: []
                                                          }
                                                        })
      end

      def category_params
        {
          name: category['Name'],
          state: category['State'],
          courses_attributes: []
        }
      end

      def course_params
        {
          name: course["Name"],
          state: course['State'],
          author: course['Author']
        }
      end

      def add_categories_attributes
        json_params['vertical']['categories_attributes'].last['courses_attributes'] << course_params
      end

      def build_courses_params
        courses.each do |course|
          course(course)
          add_categories_attributes if course['Categories'] == category['Id']
        end
      end

      def build_category_params
        json_params['vertical']['categories_attributes'] << category_params
        build_courses_params
      end
    end
  end
end
