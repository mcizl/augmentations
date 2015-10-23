# "Augmentations" plugin for Rails.
# By Henrik Nyh <http://henrik.nyh.se> under the MIT license for DanceJam <http://dancejam.com> 2008-09-10.
# See README for usage.
# By Henrik Nyh 2015-04-02 under the MIT license.

class ::Object
  def self.augment(*mods, **opts)
    mods.each { |mod| class_exec **opts, &mod.augmentation }
  end
end
