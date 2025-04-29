class TeasSerializer
    def self.serialize_teas(teas)
        {
            data: teas.map do |tea|
                {
                    id: tea.id,
                    title: tea.title,
                    description: tea.description,
                    temperature: tea.temperature,
                    brew_time: tea.brew_time,
                    price: tea.price
                }
            end
        }
    end
end