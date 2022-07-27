class YieldInBatches
  include BaseInteractor

  expects :batch_size, default: 100
  expects :collection
  expects :block

  def call
    count = collection.count

    return if count.zero?

    (count.to_f / batch_size).ceil.times do |i|
      batch = collection.offset(i * batch_size).limit(batch_size)
      block.call(batch)
    end
  end
end
