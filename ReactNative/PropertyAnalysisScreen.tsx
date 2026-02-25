import React, { useState } from 'react';
import { View, Text, TextInput, Button } from 'react-native';

const PropertyAnalysisScreen = () => {
    const [propertyValue, setPropertyValue] = useState('');
    const [rentalIncome, setRentalIncome] = useState('');
    const [results, setResults] = useState(null);

    const analyzeProperty = () => {
        // Simple analysis logic for demonstration
        const value = parseFloat(propertyValue);
        const income = parseFloat(rentalIncome);
        if (!isNaN(value) && !isNaN(income)) {
            const roi = (income / value) * 100;
            setResults({ roi });
        } else {
            setResults(null);
        }
    };

    return (
        <View style={{ padding: 20 }}>
            <Text style={{ fontSize: 24 }}>Property Analysis</Text>
            <TextInput
                placeholder="Enter Property Value"
                keyboardType="numeric"
                onChangeText={text => setPropertyValue(text)}
                value={propertyValue}
                style={{ borderWidth: 1, marginBottom: 10, padding: 10 }}
            />
            <TextInput
                placeholder="Enter Rental Income"
                keyboardType="numeric"
                onChangeText={text => setRentalIncome(text)}
                value={rentalIncome}
                style={{ borderWidth: 1, marginBottom: 10, padding: 10 }}
            />
            <Button title="Analyze" onPress={analyzeProperty} />
            {results && <Text style={{ marginTop: 20 }}>ROI: {results.roi.toFixed(2)}%</Text>}
        </View>
    );
};

export default PropertyAnalysisScreen;