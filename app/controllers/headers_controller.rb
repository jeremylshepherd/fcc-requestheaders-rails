class HeadersController < ApplicationController
    
    def show
        user_agent = request.user_agent
        ip = request.ip
        language = request.env['HTTP_ACCEPT_LANGUAGE']
        lang = language.split(';')
        hash = {:language => lang[0], :software => software_data(user_agent), :ip => ip}
        render json: hash, status: 200
    end
    
    private
    def software_data(str)
        data = str.split('')
        start = data.index('(') + 1
        finish = data.index(')') - start
        return data.slice(start, finish).join('')
    end
    
end
