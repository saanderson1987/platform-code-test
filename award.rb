class Award 

    attr_accessor :expires_in, :quality

    def initialize(expires_in, quality) 
        @expires_in = expires_in
        @quality = quality
    end

    def update_quality
        if self.quality > 0
            self.quality -= 1
        end

        self.expires_in -= 1

        if self.expires_in < 0 && self.quality > 0
            self.quality -=1
        end
    end 

end

class BlueStarAward < Award
    def update_quality
        if self.quality > 0
            self.quality -= 2
        end 

        self.expires_in -= 1

        if self.expires_in < 0
            self.quality -= 2
        end

        if self.quality < 0
            self.quality = 0
        end
    end 
end

class BlueFirstAward < Award
    def update_quality
        if self.quality < 50
            self.quality += 1
        end

        self.expires_in -= 1

        if self.expires_in < 0 && self.quality < 50
            self.quality +=1
        end
    end
end 

class BlueCompareAward < Award
    def update_quality
        if self.quality < 50
            self.quality += 1
            if self.expires_in < 11  && self.quality < 50
                self.quality += 1
            end
            if self.expires_in < 6 && self.quality < 50
                self.quality += 1
            end
        end

        self.expires_in -= 1

        if self.expires_in < 0
            self.quality = 0
        end 
    end
end 

class BlueDistinctionPlusAward < Award
    def update_quality
        # never decreases in quality
    end

end
