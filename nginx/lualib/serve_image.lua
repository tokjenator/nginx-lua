
local magick = require("magick")

function process_image(image, args)

    local transformed_image = magick.load_image_from_blob(image)

    if args.width ~= nil or args.height ~= nil then
        local ratio = transformed_image:get_height() / transformed_image:get_width()
        local w = tonumber(args.width); h = tonumber(args.height)
        if w == nil then w = h / ratio end
        if h == nil then h = w * ratio end
        transformed_image:scale(w, h)
    end

    if args.blur ~= nil then
        local sigma, radius = args.blur:match("(%d+),(%d+)")
        transformed_image:blur(tonumber(sigma), tonumber(radius))
    end

    return transformed_image:get_blob()
end

function process_request()
    local args = ngx.req.get_uri_args()
    local image_id = ngx.var.uri:match("([^/]+)$")
    local res = ngx.location.capture("/images/" .. image_id .. ".jpg")

    -- Handle response
    if(res.status == 200) then
        ngx.header.content_type = "image/jpeg"
        ngx.print(process_image(res.body, args))
    else
        ngx.status = 404
        ngx.header.content_type = "text/plain"
        ngx.print("Resource with id " .. image_id .. " was not found.")
    end
end

process_request()

