module CocktailsHelper

  def photo?(elm)
    if elm.photo?
      (cl_image_path elm.photo.path, height: 300, width: 400, crop: :fill, gravity: :auto)
    else
      image_path "cocktail.jpg"
    end
  end

end
