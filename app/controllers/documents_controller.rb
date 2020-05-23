class DocumentsController < ApplicationController

    def generate
        respond_to do |format|
            format.pdf do
                render pdf: "test",
                # page_size: 'A4',
                # :wkhtmltopdf => '/usr/local/bin/wkhtmltopdf',
                template: "documents/test.html.erb",
                layout: "pdf.html"
                # orientation: "Landscape",
                # lowquality: true,
                # zoom: 1,
                # dpi: 75
            end
        end
    end

end