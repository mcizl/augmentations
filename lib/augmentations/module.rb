# "Augmentations" plugin for Rails.
# By Henrik Nyh <http://henrik.nyh.se> under the MIT license for DanceJam <http://dancejam.com> 2008-09-10.
# See README for usage.
# By Henrik Nyh 2015-04-02 under the MIT license.

class ::Module
  def augmentation(**opts, &block)
    @augmentation ||= block
  end
end
