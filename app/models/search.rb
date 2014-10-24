class Search

 def search(search)
   find(:all, conditions: ['name LIKE ?', "%#{search}"])
 end

end